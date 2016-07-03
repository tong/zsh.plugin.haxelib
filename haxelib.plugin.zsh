
function __haxelib_list() {
	ls $HAXELIB | sed -e 's/,/./g'
}

__haxelib_complete() {

	if (( CURRENT == 2 )); then
		_arguments=(
			'install':'install a given library, or all libraries from a hxml file'
			'update:update a single library (if given) or all installed libraries'
			'remove:remove a given library/version'
			'list:list all installed libraries'
			'set:set the current version for a library'
			'search:list libraries matching a word'
			'info:list information on a given library'
			'user:list information on a given user'
			'config:print the repository path'
			'path:give paths to libraries'
			'version:print the currently using haxelib version'
			'help:display this list of options'
			'submit:submit or update a library package'
			'register:register a new user'
			'dev:set the development directory for a given library'
			'git:use Git repository as library'
			'hg:use Mercurial (hg) repository as library'
			'setup:set the haxelib repository path'
			'newrepo:create a new local repository'
			'deleterepo:delete the local repository'
			'convertxml:convert haxelib.xml file to haxelib.json'
			'run:run the specified library with parameters'
			'proxy:setup the Http proxy'
			'--flat:do not use --recursive cloning for git'
			'--always:answer all questions with yes'
			'--debug:run in debug mode, imply not --quiet'
			'--quiet:print less messages, imply not --debug'
			'--system:run bundled haxelib version instead of latest update'
			'--never:answer all questions with no'
			'--global:force global repo if a local one exists'
		)
		_describe -t commands "haxelib subcommand" _arguments

	elif ((CURRENT == 3)); then
		case "$words[2]" in
			update|remove|set)
				compadd -- `ls $HAXELIB | sed -e 's/,/./g'`
				#compadd -- __haxelib_list $HAXELIB
			;;
			#TODO submit|local) #list *.zip
			#TODO run) #list libraries having a run.n
		esac

	fi
}

compdef __haxelib_complete haxelib

#alias hxl='haxelib'
#alias hxlu='haxelib update'
