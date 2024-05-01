#let iconGrid(icon, content) = box( height: 8pt, grid(
  columns: (auto, auto),
  column-gutter: 1em,
  icon, content
))

#let githubLink(content) = iconGrid(
  image(
    width: 10pt,
    "github-mark.png"
  ), 
  content
)

#let email(content) = iconGrid(
  emoji.mail, 
  content
)
  
#let phone(content) = iconGrid(
  emoji.phone.receiver,
  content
)


#let build(letter) = {
  page(
    paper: "a4",
    margin: (
      top: 45mm, 
      bottom: 1.69cm,
      left: 2.5cm,
      right: letter.rightMargin
    ),
    [
      #grid(
        columns: (10cm, auto),
        [
          #text(8pt)[
            \
            \
            \
            \
            #underline[#letter.senderName, #letter.senderStreet #letter.senderHouseNo, #letter.senderZipCode #letter.senderCity]
          ]\
          #letter.receiverName \
          #letter.receiverStreet #letter.receiverHouseNo \
          #letter.receiverZipCode #letter.receiverCity \
          #letter.receiverMail
        ],
        [
          #move(
            dx: 0mm,
            dy: 5mm,
            [
              #letter.senderName \
              #letter.senderStreet #letter.senderHouseNo \
              #letter.senderZipCode #letter.senderCity \
              #phone(letter.senderPhoneNo)\
              #email(letter.senderMail)\
              #if letter.senderGithub != none {
                githubLink(letter.senderGithub)
                linebreak()
              }
              #v(8.46mm)
            ]
          )
        ]
      )
      #align(
        right,
        datetime.today().display("[day].[month].[year]")
      )

      #text(
        weight: "bold",
        letter.subject
      )\
      \
      \
      #letter.opening,\
      \
      #par(
        justify: true,
        letter.body
      )
      \
      #letter.greeting \
      \
      #letter.senderName
    ]
  )
}
#let makeLetter(
  rightMargin: 2cm,
  senderName: "Noname Given",
  senderStreet: "No-Given-Street",
  senderHouseNo: "00",
  senderZipCode: "12345",
  senderCity: "Somwheretown",
  senderPhoneNo: "0123 456789",
  senderMail: "no@given.mail",
  senderGithub: none,
  receiverName: "Noreceiver Name Given",
  receiverStreet: "No-Receiver-Street",
  receiverHouseNo: "11",
  receiverZipCode: "54321",
  receiverCity: "Receiver-Lake-City",
  receiverMail: "receiver@mail.com",
  subject: "Application to a not defined job",
  opening: "Dear ladies and gentlemen",
  body: "Lorem ipsum",
  greeting: "Best regards,",
) = {
  let letter = (:)
  letter.insert("rightMargin", rightMargin)
  letter.insert("senderName", senderName) 
  letter.insert("senderStreet", senderStreet) 
  letter.insert("senderHouseNo", senderHouseNo) 
  letter.insert("senderZipCode", senderZipCode) 
  letter.insert("senderCity", senderCity) 
  letter.insert("senderPhoneNo", senderPhoneNo) 
  letter.insert("senderMail", senderMail) 
  letter.insert("senderGithub", senderGithub) 
  letter.insert("receiverName", receiverName) 
  letter.insert("receiverStreet", receiverStreet) 
  letter.insert("receiverHouseNo", receiverHouseNo) 
  letter.insert("receiverZipCode", receiverZipCode) 
  letter.insert("receiverCity", receiverCity) 
  letter.insert("receiverMail", receiverMail) 
  letter.insert("subject", subject) 
  letter.insert("opening", opening) 
  letter.insert("body", body) 
  letter.insert("greeting", greeting) 
  
  build(letter)
}
