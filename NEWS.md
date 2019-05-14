# fakir 0.2.0

* New fake dataset with `fake_sondage_answers`: answers to location-transport habits.

# fakethis 0.1.0

* New fake dataset with `fake_visits`: web page visits.
* New dataset: Map of France ("fra_sf")
* fausse_base_clients: point_fidelite is linked to entry_date.
* fausse_base_clients: priority is linked to point_fidelite.
* fausse_base_clients: some regions are more represented than others
* fausse_base_clients: some regions have NA values that may be fill with left_join with fra_sf dataset
* fausse_base_clients: some departement have NA values that may be fill using id_dpt
* fausse_base_ticket_client: Same client can have multiple tickets
* fausse_base_ticket_client:  Some clients are more sampled than others
* fausse_base_ticket_client:  Some types are more sampled than others
* fausse_base_ticket_client:  Some etat are more sampled than others
* Added a `NEWS.md` file to track changes to the package.
