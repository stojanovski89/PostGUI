COMMIT=$(git rev-parse --verify HEAD)
docker image build . --build-arg "app_name=alcatraz" -t "alcatraz:0.1" -t "myapp:${COMMIT}"
echo "EOB"

