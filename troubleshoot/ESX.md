
## Sound
https://virtualvillage.cloud/?p=546

Sound Card in vSphere Virtual Machine is an unsupported configuration. This is feature dedicated to Virtual Machines created in VMware Workstation. However, you can still add HD Audio device to vSphere Virtual Machine by manually editing .vmx file. I have tested it in our lab environment and it works just fine.

Below  procedure how to do this:

1. Verify storage where VM with no soundcard reside

![soundcard1](https://virtualvillage.cloud/wp-content/uploads/2017/01/soundcard1.png)

2. Login with root to the ESXi host where VM reside using SSH.  
    3. Navigate to /vmfs/volumes/<VM LUN>/<VM folder>  
    In my example it was:  
    ~# cd /vmfs/volumes/Local_03esx-mgmt_b/V11_GSS_DO  
    4. Shut down problematic VM  
    5. Edit .vmx file using VI editor.

IMPORTANT:  
Make a backup copy of the .vmx file. If your edits break the virtual machine, you can roll back to the original version of the file.  
More information about editing files on ESXi host, refer to KB article: [https://kb.vmware.com/kb/1020302](https://kb.vmware.com/kb/1020302)

6. Once you have open vmx to edit, navigate to the bottom of the file and add following lines to the .vmx configuration file:  
    sound.present = “true” 
    sound.allowGuestConnectionControl = “false”
    sound.virtualDev = “hdaudio”
    sound.fileName = “-1” 
    sound.autodetect = “true”
7. Save file and Power-On Virtual machine.
8. Once it have booted, and you have enabled Windows Audio Service, sound will work fine.

If you go to “Edit Settings” of the VM, you can see information that device is unsupported. Please be aware that if after adding sound card to you virtual machine, you may exprience any kind of unexpected behavior (tip: in our lab env work this config without issues).