#!/bin/bash -e

USER_NAME=${USER_NAME:-exaile}
USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}

# create user group
groupadd -f -g ${USER_GID} "${USER_NAME}" > /dev/null
chown --from root:root ${USER_UID}:${USER_GID} "${HOME}"

# create user with uid and gid matching that of the host user
useradd --uid ${USER_UID} --gid ${USER_GID} --home-dir "${HOME}" \
	--comment 'Exaile' "${USER_NAME}" > /dev/null
usermod --lock "${USER_NAME}"

# http://stackoverflow.com/questions/6071681/store-shell-arguments-in-file-while-preserving-quoting
storeargs() {
     while [ $# -gt 0 ]
     do 
         printf "%q " "$1"
         shift
     done   
}

# Write the commands out to a file with preserved quoting, that way they don't
# accidentally get interpreted by su
echo "#!/bin/bash" > /start
storeargs "$@" >> /start
chmod +x /start

exec su "${USER_NAME}" -c /start
