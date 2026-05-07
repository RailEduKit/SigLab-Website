## Bauplan: SigLab OER-Dokumentation

Ich möchte das siglab dür das Internet dokumentieren als Open Educational Ressource/ Open Educational Practices und wie man es herstellt. 

---

### Grundprinzip: Thin Slice First

Nicht Kapitel für Kapitel schreiben, sondern **vertikal durch alle Schichten** – lieber eine schmale, vollständige und veröffentlichbare Version als ein breites, halbfertiges Dokument. Jede Phase endet mit etwas Veröffentlichbarem.

Lizenz: CC BY-SA 4.0 empfohlen
Sprache: EN
URL: siglab.railedukit.org
REPO: https://codeberg.org/RailEduKit/SigLab-Website
REPO-Mirror: https://github.com/RailEduKit/SigLab-Website

---

### Phase 1 – MVP: Verstehen & Nachbauen *(2–4 Wochen)*
**Ziel:** Eine fremde Person kann SigLab verstehen und theoretisch nachbauen.

**Priorität 1 – Konzeptseite**
- Was ist SigLab (aus der Spielbeschreibung destilliert)
- Lernziele
- Was es unterscheidet
- Zielgruppen

**Priorität 2 – Stückliste & Materialien**
- Vollständige Bill of Materials mit Mengen
- Quellenangaben / Bezugsquellen
- Fotos der Komponenten

**Priorität 3 – Aufbauanleitung (grob)**
- Schritt-für-Schritt mit Fotos, darf noch unvollständig sein
- Mindestens: Gleismodifikation, Signale, Markierungen

**Quality Gate 1:**
- [ ] Eine fremde Person versteht in unter 5 Minuten, was SigLab ist
- [ ] Die Stückliste ist vollständig und beschaffbar
- [ ] Mindestens eine externe Person hat die Anleitung gelesen und Feedback gegeben
- [ ] Alle Bilder sind unter freier Lizenz oder selbst erstellt
- [ ] Kein „lorem ipsum", keine toten Links

---

### Phase 2 – Spielen: Regeln & erstes Szenario *(2–3 Wochen)*
**Ziel:** Jemand kann mit der Dokumentation eine erste Session durchführen.

**Priorität 1 – Regelwerk**
- Rundenablauf
- Kernregeln (Blockbedingungen, Signalabhängigkeiten)
- Tutor-Rolle

**Priorität 2 – 2–3 Einstiegsszenarien**
- Je: Ausgangslage, Aufgabe, Hinweise für Lehrende
- Druckfertige Szenariokarte als Download

**Priorität 3 – Druckpaket v1**
- Regelkarten + Szenariokarten als PDF-Bundle

**Quality Gate 2:**
- [ ] Eine Person, die SigLab nicht kennt, kann eine Session leiten – nur mit dieser Dokumentation
- [ ] Alle Szenarien sind playtested und die Lösungshinweise stimmen
- [ ] Downloads funktionieren und sind barrierefrei (nicht nur Scan, sondern echtes PDF)
- [ ] Regeltext ist von jemandem mit Bahnhintergrund auf Korrektheit geprüft

---

### Phase 3 – Didaktik & Fortgeschrittene Inhalte *(3–4 Wochen)*
**Ziel:** Lehrende können SigLab curricular einbetten und professionell einsetzen.

**Priorität 1 – Durchführungsleitfaden**
- Sessionplanung (3 × 2,5 Std.)
- Raumsetup, Gruppengrößen
- Typische Schwierigkeiten & Reaktionen
- Debriefing-Methoden

**Priorität 2 – Weitere Szenarien (mittlere & fortgeschrittene)**
- Mindestens 3–5 weitere

**Priorität 3 – Einbettung in Lehrpläne**
- Konkrete Vorschläge für Ingenieursstudiengänge / Bahnausbildung

**Quality Gate 3:**
- [ ] Lehrende aus mindestens zwei verschiedenen Kontexten haben die Dokumentation genutzt und Feedback gegeben
- [ ] Debriefing-Sektion enthält mindestens eine erprobte Methode
- [ ] Fortgeschrittene Szenarien sind playtested

---

### Phase 4 – OER-Reife & Community *(laufend)*
**Ziel:** Die Dokumentation lädt aktiv zur Nachnutzung und Weiterentwicklung ein.

- Forschungshintergrund & Literatur
- Evaluationsergebnisse (wenn vorhanden)
- Mitmachen-Seite (wie man Szenarien beiträgt, Fehler meldet)
- Übersetzung (EN, falls noch nicht geschehen)
- Versionierung sichtbar machen (Changelog)

**Quality Gate 4:**
- [ ] Lizenz ist auf jeder Seite sichtbar und korrekt
- [ ] Jemand außerhalb des Originalteams hat SigLab nachgebaut – und es hat funktioniert
- [ ] Es gibt einen definierten Weg, wie Externe beitragen können
- [ ] Barrierefreiheit: Alt-Texte auf allen Bildern, ausreichende Kontraste

---

## Übergreifende Quality Gates *(gelten immer)*

Diese Kriterien werden bei **jeder Phase** geprüft, nicht nur einmalig:

| Kriterium | Prüfmethode |
|---|---|
| Kein Inhalt ohne Foto/Illustration | Sichtkontrolle |
| Alle externen Links funktionieren | Linkchecker im CI |
| Mobile lesbar | Sichtkontrolle auf Mobilgerät |
| Lizenzangabe vollständig | Checkliste |
| Kein Fachbegriff ohne Erklärung beim ersten Auftreten | Redaktionsreview |

---

## Visualisierung: Roadmap

```
Phase 0      Phase 1           Phase 2           Phase 3       Phase 4
Fundament  → MVP (Verstehen  → Spielen          → Lehren     → OER-Reife
             & Nachbauen)      (Regeln +           (Didaktik,
                               Szenarien)          Curriculum)

Deploybar    Lesbar &          Durchführbar        Einbettbar    Nachnutzbar
             beschaffbar
```

---

## Empfehlung für den Start

Fang nicht mit dem Schreiben an – fang mit **drei Dingen** an:

1. **Fotos machen** – von allem, was du hast. Rohmaterial. Lieber zu viele als zu wenige. Inhalte ohne Bilder fühlen sich in einer Bauanleitung nicht fertig an.
2. **Stückliste aufschreiben** – komplett, mit Mengen. Das ist der härteste Test, ob die Dokumentation wirklich zum Nachbauen taugt.
3. **Einen Reviewpartner benennen** – jemand, der SigLab *nicht* kennt und bereit ist, die Quality Gates ehrlich zu prüfen.
