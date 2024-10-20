Based on the search results and your query, there are a few easier options for creating and managing terminal-based menus:

1. simple-term-menu: This is a Python library that provides an easy way to create interactive command-line menus. It's simple to use and supports arrow key navigation, vim-style motions, and customizable styles. Here's a basic example:

```python
from simple_term_menu import TerminalMenu

options = ["Option 1", "Option 2", "Option 3"]
terminal_menu = TerminalMenu(options)
menu_entry_index = terminal_menu.show()
```

2. Whiptail: This is a lightweight tool that comes pre-installed on many Linux distributions. It's easier to use than dialog and can create various types of menus and dialog boxes. Here's a simple menu example:

```bash
#!/bin/bash
OPTION=$(whiptail --title "Menu Example" --menu "Choose an option" 15 60 4 \
"1" "Option 1" \
"2" "Option 2" \
"3" "Option 3" 3>&1 1>&2 2>&3)

case $OPTION in
    1) echo "You chose Option 1";;
    2) echo "You chose Option 2";;
    3) echo "You chose Option 3";;
esac
```

3. Dialog: This is a more feature-rich alternative to whiptail, offering more customization options. Here's a basic menu example:

```bash
#!/bin/bash
OPTION=$(dialog --title "Menu Example" --menu "Choose an option" 15 60 4 \
"1" "Option 1" \
"2" "Option 2" \
"3" "Option 3" 3>&1 1>&2 2>&3)

case $OPTION in
    1) echo "You chose Option 1";;
    2) echo "You chose Option 2";;
    3) echo "You chose Option 3";;
esac
```

4. smenu: This is a powerful selection filter that can be used to create interactive menus. It's more flexible than the other options but might require more setup.

For managing changes to the terminal menu, you could:

1. Use version control (like Git) to track changes to your menu scripts.
2. Create a configuration file (e.g., JSON or YAML) to define menu options, making it easier to add, remove, or modify menu items without changing the core script.
3. Use a higher-level scripting language like Python to create more complex menu systems with easier maintenance.

Overall, simple-term-menu (for Python) or whiptail (for bash) are likely the easiest options for creating and managing terminal menus, offering a good balance of simplicity and functionality.

Citations:
[1] https://pypi.org/project/simple-term-menu/0.5.0/
[2] https://www.cisco.com/c/en/us/td/docs/ios/fundamentals/configuration/guide/TIPs_Conversion/cf_15_1s_book/cf_connections.html
[3] https://github.com/p-gen/smenu
[4] https://funprojects.blog/2022/04/06/text-interfaces-with-whiptail-and-dialog/
[5] https://iterm2.com/documentation-menu-items.html
[6] https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail
[7] https://github.com/toolleeo/cli-apps
[8] https://stackoverflow.com/questions/1562666/bash-scripts-whiptail-file-select
