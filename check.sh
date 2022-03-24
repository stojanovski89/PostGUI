
CLIENT=$1

while [ "$(kubectl get pods -l=app="${CLIENT}" -o jsonpath='{.items[*].status.containerStatuses[0].ready}')" != "true" ]; do
   sleep 5
   echo "Waiting for pod to be ready."
done