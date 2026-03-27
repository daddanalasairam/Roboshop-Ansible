git pull
if [ $# -ne 2 ]; then
  echo "Input Missing"
  echo Usage: "bash run.sh <component-name> <env>"
  exit 1
fi
ansible-playbook -i $1-$2.sairamdevops.online, -e ansible_user=ec2_user -e ansible_password=DevOps321 -e env=$2 app_name=$1 roboshop.yml