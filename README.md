# din5008-typst
A simple implementation of DIN 5008 B in typst used for German business letters.

## Usage

Example:
![Example image of the rendered typst code.](./example.svg)
```typst
#import "din5008-letter.typ": *
#set text(
  font: "HK Grotesk",
  size: 11pt
)
#makeLetter(
  senderName: "Max Mustermann",
  senderStreet: "Schlossallee",
  senderHouseNo: "5",
  senderZipCode: "12345",
  senderCity: "Musterstadt",
  senderPhoneNo: "0123 456789",
  senderMail: "max.mustermann@gmail.com",
  senderGithub: "https://github.com/maxMusti",
  receiverName: "Die Firma AG",
  receiverStreet: "Geschäftsstraße",
  receiverHouseNo: "7",
  receiverZipCode: "54321",
  receiverCity: "Unternehmenstadt",
  receiverMail: "info@die_firma.com",
  subject: "Bewerbung auf die Stelle als \"Typst Developer\" in Unternehmenstadt",
  opening: "Sehr geehrte Damen und Herren",
  body: [
    hiermit möchte ich mich auf ...
  ],
  greeting: "Beste Grüße"
)
```
