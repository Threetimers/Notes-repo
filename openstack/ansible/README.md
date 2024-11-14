
## Notes

- https://docs.ansible.com/ansible/latest/collections/openstack/cloud/openstack_inventory.html

### Requirement:


Install a plugin for ansible for the **dynamic inventory**
- `ansible-galaxy collection install community.general`
- `ansible-galaxy collection list`

You need to create a virtual environment in order to install the library **openstacksdk**:

- `python3 -m venv .venv`
- `pip install openstacksdk`