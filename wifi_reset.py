import paramiko
from env import user, password, host, reboot_command


def restart_wifi():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=password, timeout=10)
    ssh.exec_command(reboot_command)
    ssh.close()
