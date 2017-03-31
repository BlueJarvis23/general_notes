
# Manjaro

## Steam
Out of the box `steam` was not working. By launching steam from a terminal I was able to see the error.

I used `export STEAM_RUNTIME=0` to change the runtime and then when I launched `steam` again. Steam 
then updated it's packages, but still wouldn't work and complained of missing packages until I reset 
my runtime by running `export STEAM_RUNTIME=1`. 
