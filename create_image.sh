CLIENT=$1
VERSION=$2

COMMIT=$(git rev-parse --verify HEAD)
#today=$( date +%Y%m%d )
docker image build . --build-arg "app_name=${CLIENT}" -t "alcatraz:${VERSION}" -t "alcatraz:${COMMIT}"
echo "Image created"

