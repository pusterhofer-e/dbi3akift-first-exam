/* 
- Datenbankindex dient der Sortierung der Datensätze nach einem gewählten Parameter (zb Nachnamen im Telefonbuch).
- Dadurch wird die Suche schneller O(log n).

- aus ERD: contacts(last_name), message(sender), mailboxes(name), addresses(display_name)

- Contacts nach last_name sortiert, liefert schnellere Suchergebnisse, sofern nicht jeder zweite Huber heißt.

*/


CREATE INDEX IF NOT EXISTS idx_contacts_last_name 
ON contacts(last_name);