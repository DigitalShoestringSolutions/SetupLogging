# init_SM.sh
# initialisation scipt run on download of this Service Module

# Get location of this script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Take init action:
$SCRIPT_DIR/setup_logging.sh
