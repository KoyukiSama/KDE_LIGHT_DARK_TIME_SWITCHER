If you don't like a line between dark and light mode like the kitty terminal, use a # comment to comment it out. 

also you can add this into fish to let it run constantly every 10 minutes, that's how I intended it, or any shell of your choice.

export LC_ALL=en_US.UTF-8 <-- if you encounter the UTF bug
path/to/light-dark-switcher.sh > script.log 2>&1 &
