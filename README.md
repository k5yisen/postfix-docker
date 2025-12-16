
### Build the postfix-smtp Docker image
`task build`

### Create Docker network if it doesn't exist
`task docker-network`

### Run the postfix container
`task run`

### Test with sender canonical rewriting to devk5yops.com
`task test-send-0`

### Check mail logs for SPF test results
`task check-send-logs-0`


### Test send-only server with info@devk5yops.com
`task test-send-1`

### Check mail logs for send test results
`task check-send-logs-1`

### Check postfix mail queue
`task check-queue`

### Tail mail logs
`task tail-logs`

### Asciinema postfix-docker-installation
[![asciicast](https://asciinema.org/a/jixyd0kj4RwRpOwSDBKJnjx3A.svg)](https://asciinema.org/a/jixyd0kj4RwRpOwSDBKJnjx3A)