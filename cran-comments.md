## R CMD check results

0 errors | 0 warnings | 0 note

* This is a new resubmission after Victoria Wimmer feedbacks.

> "If there are references describing the methods in your package, please add these in the description field of your DESCRIPTION file"

=> There is no references in the package

> Please add \value to .Rd files regarding exported methods
> Missing Rd-tags:
>        fake_ticket_client.Rd: \value
>        pipe.Rd: \value

=> Added value to fake_ticket_client.Rd & pipe.Rd
