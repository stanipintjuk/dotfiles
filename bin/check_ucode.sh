# Prints the microcode part from journalctl.
# Use this script if when you want to check your microcode version
journalctl --no-hostname -o short-monotonic --boot -0 \
  | sed -n '1,/PM: Preparing system for sleep/p' | grep 'microcode\|smp'
