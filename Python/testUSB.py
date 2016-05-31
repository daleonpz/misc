import usb.core
import usb.util
import logging

# find our device
dev = usb.core.find(idVendor=0x48d, idProduct=0x1165)
# my EUSIPCO USB

# was it found?
if dev is None:
	raise ValueError('Device not found')

# set the active configuration. With no arguments, the first
# configuration will be the active one
dev.set_configuration()

# get an endpoint instance
cfg = dev.get_active_configuration()
intf = cfg[(0,0)]

os.environ["PYUSB_DEBUG"] = "warning"
os.environ["PYUSB_LOG_FILENAME"] = "/home/dnl/Documents/MyStuff/training/Python/log"
logging.debug("PYUSB_DEBUG")

ep = usb.util.find_descriptor(
    intf,
    # match the first OUT endpoint
    custom_match = \
    lambda e: \
        usb.util.endpoint_direction(e.bEndpointAddress) == \
        usb.util.ENDPOINT_OUT)

assert ep is not None

# write the data
ep.write('test')
