#!/bin/bash

[ -z "${__cm_libexec_dir}" ] && { echo 'Error: you must define ${__cm_libexec_dir}'; exit 1; }

read -p "Command dir? " command_dir
if [ -d "${__cm_libexec_dir}/$command_dir" ]; then

	echo "Commands in $command_dir :"		

	echo -e "prio\t\tcommand"
	echo "-----------------------"
	for c in $(ls -1 "${__cm_libexec_dir}/$command_dir" | grep -v "^_"); do
		[ -f "${__cm_libexec_dir}/$command_dir/_${c}_priority" ] && echo -e $(cat "${__cm_libexec_dir}/$command_dir/_${c}_priority")"\t\t$c"
		echo -e ${__cm_default_priority}*"\t\t$c"
	done
	echo "NB priority with [*] are setted by default priority"

else
	echo "${__cm_libexec_dir}/$command_dir" does not exists
fi

read -p "Command name? " command_name

if [ -e "${__cm_libexec_dir}/$command_dir"/$command_name ]; then
	read -n1 -p "$command_name exists overwrite? (y/n) "
	echo
	[[ $REPLY = [nN] ]] && exit 1
fi

read -p "Command priority? " command_priority

read -n1 -p "$command_name have predictable completion? (y/n) "
echo 
[[ $REPLY = [yY] ]]  && autocomplete=y

read -p "Help string? " command_help

[ -d "${__cm_libexec_dir}/$command_dir" ] || mkdir -p "${__cm_libexec_dir}/$command_dir"

cd $(dirname "$0")

echo $command_priority > "${__cm_libexec_dir}/$command_dir"/_${command_name}_priority

cp skel/command "${__cm_libexec_dir}/$command_dir"/$command_name
cp skel/syntax "${__cm_libexec_dir}/$command_dir"/_${command_name}_syntax
cp skel/complete "${__cm_libexec_dir}/$command_dir"/_${command_name}_complete

[ $autocomplete == "y" ] || touch "${__cm_libexec_dir}/$command_dir"/_${command_name}_nocomplete

cat << EOF > "${__cm_libexec_dir}/$command_dir"/_${command_name}_help
#!/bin/bash

. ${__cm_lib_dir}/cmlib

__cm_print_help_header $@

echo "$command_help"
echo 
echo "Parameter: "

__cm_print_help_bottom
EOF

chmod +x "${__cm_libexec_dir}/$command_dir"/_${command_name}_nocomplete

echo "Don't forget to implement "${__cm_libexec_dir}/$command_dir"/$command_name"
echo "Don't forget to implement "${__cm_libexec_dir}/$command_dir"/_${command_name}_syntax"
echo "Don't forget to implement "${__cm_libexec_dir}/$command_dir"/_${command_name}_complete"
echo "Don't forget to implement "${__cm_libexec_dir}/$command_dir"/_${command_name}_help"
