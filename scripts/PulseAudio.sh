### Stuff for Twitch Sinks
### Sinks are audio outputs for devices
pactl load-module module-null-sink sink_name=Voice_Chat_Sink  sink_properties=device.description=Voice_Chat_Sink
pactl load-module module-null-sink sink_name=Game_Sink        sink_properties=device.description=Game_Sink
pactl load-module module-null-sink sink_name=Music_Sink       sink_properties=device.description=Music_Sink

### Loopbacks
### These modules loop the sinks back into the main output
pactl load-module module-loopback sink=alsa_output.pci-0000_00_1f.3.analog-stereo  source=Voice_Chat_Sink.monitor
pactl load-module module-loopback sink=alsa_output.pci-0000_00_1f.3.analog-stereo  source=Game_Sink.monitor
pactl load-module module-loopback sink=alsa_output.pci-0000_00_1f.3.analog-stereo  source=Music_Sink.monitor


