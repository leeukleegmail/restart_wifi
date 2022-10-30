import os
host = "192.168.1.1"
user = "root"
file_name = "id_rsa.pub"
reboot_command = "reboot"

i_am = os.popen("whoami").read().strip()