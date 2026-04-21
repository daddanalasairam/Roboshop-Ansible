# "@" is used to hide the lines, so it only prints output
default:
    @git pull &>/dev/null
    @ansible-playbook -i $(component)-$(env).sairamdevops.online, -e ansible_user=ec2_user -e ansible_password=DevOps321 -e env=$(env) component=$(component) roboshop.yml