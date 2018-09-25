# Relationales Schema

**person** (<u>pid: int</u>, geburtstag: date, familienstand: char(1), nachname: text, vorname: text, sub_type: char(1))

**adresse** (<u>pid: int</u> → person (pid), hausnummer: text, strasse: text, postleitzahl: text, ort: text)

**angestellter** (<u>pid: int</u> → person (pid), vertragsende: date, einstellungsdatum: date, jaehrlichesgehalt: numeric(10,2), sub_type: char(1))

**fachgebiet** (<u>id: int</u>, bezeichnung: text)

**arzt** (<u>pid: int</u> → person (pid), fachgebiet: int → fachgebiet (id))

**ausbildung** (<u>id: int </u>, bezeichnung: text)

**krankenpfleger** (<u>pid: int</u> → person (pid), arzt: int → arzt (pid), ausbildung: int → ausbildung (id))

**krankenkasse** (<u>id: int </u>, bezeichnung: text)

**patient** (<u>pid: int</u> → person (pid), krankenkasse: int → krankenkasse (id), gewicht: numeric(6,3), groesse: numeric(5,2))

**symptom** (<u>id: int </u>, bezeichnung: text)

**krankheit**(<u>whoid: text</u>, name: text)

**hatsymptom** (<u>whoid: text</u> → krankheit (whoid),	<u>symptom: int</u> → symptom (id))

**medikament** (<u>znr: text</u>, name: text)

**wechselwirkung** ( <u>znr_first: text</u> → medikament(znr), <u>znr_second: text</u> → medikament(znr), bemerkung: text)

**eingesetzt** (<u>znr: text</u> → medikament (znr), whoid: text</u> → krankheit (whoid))

**behandlung** (<u>behnr: int</u>, arzt: int → arzt (pid), patient: int → patient (pid), krankheit: text → krankheit (whoid), behandlungsdatum: date)

**hatmedikament** (<u>behnr: int</u> → behandlung (behnr), <u>znr: text</u> → medikament (znr))

