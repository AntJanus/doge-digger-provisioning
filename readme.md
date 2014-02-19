##Doge Digger Provisioning

> I ain't sayin' my VPS a doge digger -uhh!

Dogecoin is a fun little tipping currency; however, it can be difficult to dig it. It's easy to set up but a CPU-based digger will yield little to no coin, and will cost you a lot of energy, and possibly overheat your computer if not watched.

Solution?

Use a spare VPS that's already running a site and throw a CPU limiter on the digging process. This makes sure that your site doesn't slow down or you breach some arbitrary terms of agreement by keeping your CPU at 100%.

Even better, setup a cron-job to start and stop the digger to run it in the down times of your site (in the evenings and otherwise).

