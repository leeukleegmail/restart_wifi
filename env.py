from os import popen
host = "192.168.1.1"
user = "root"
file_name = "id_rsa.pub"
reboot_command = "reboot"
ping_failed = "1 packets transmitted, 0 packets received, 100.0% packet loss"

i_am = popen("whoami").read().strip()
