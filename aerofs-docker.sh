#!/bin/bash
set -ex

mkdir -p /ship/loader/run
[[ -f /ship/loader/run/repo ]] || echo 'registry.aerofs.com' > /ship/loader/run/repo
[[ -f /ship/loader/run/target ]] || echo 'maintenance' > /ship/loader/run/target

[[ -f /ship/loader/run/tag ]] || {
  TAG=$(docker run --rm $(cat /ship/loader/run/repo)/aerofs/loader tag)
  echo ${TAG} > /ship/loader/run/tag
}

IMAGES=$(docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $(cat \
/ship/loader/run/repo)/aerofs/loader images)
for i in ${IMAGES}; do
    IMAGE="$(cat /ship/loader/run/repo)/${i}:$(cat /ship/loader/run/tag)"
    set +e; docker inspect "${IMAGE}" 1>/dev/null 2>/dev/null; EXIT=$?; set -e
    [[ ${EXIT} = 0 ]] || docker pull "${IMAGE}"
done

while true; do
  IMAGE="$(cat /ship/loader/run/repo)/aerofs/loader:$(cat /ship/loader/run/tag)"

  CONTAINER=loader-$(cat /ship/loader/run/tag)

  [[ "$(docker ps -a | grep ${CONTAINER})" ]] || \
      docker create --name "${CONTAINER}" \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /ship/loader/run/repo:/host/ship/loader/run/repo \
        -v /ship/loader/run/tag:/host/ship/loader/run/tag \
        -v /ship/loader/run/target:/host/ship/loader/run/target \
        "${IMAGE}" load /host/ship/loader/run/repo /host/ship/loader/run/tag /host/ship/loader/run/target

  echo 'Starting Loader...'
  docker start -a "${CONTAINER}"
  echo 'Loader stopped'
done
