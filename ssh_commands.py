import paramiko


def run_command_via_ssh(host, user, password, command):
    print("About to run '{}' command".format(command))
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=password, timeout=10)
    stdin, stdout, stderr = ssh.exec_command(command)
    for line in iter(stdout.readline, ""):
        print(line, end="")
    ssh.close()
