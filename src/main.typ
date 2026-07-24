#import "@preview/cheq:0.4.0": checklist

// ─────────────────────────────────────────────
//  Document Setup
// ─────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: none,
)

#set text(
  font: "Libertinus Serif",
  size: 10.5pt,
  lang: "en",
)

#set heading(
  numbering: none,
)

#show: checklist.with(
  fill: white,
  stroke: rgb("1a1a1a"),
  radius: .08em,
  light: false,
)

// ─────────────────────────────────────────────
//  Title
// ─────────────────────────────────────────────
#align(center)[
  #text(size: 24pt, weight: "bold")[✈️ Travel Checklist]
  #v(4pt)
  #text(size: 10pt, fill: rgb("666666"))[
    Check off items as you pack. No printer? Use a pen on screen. (Just kidding.)
  ]
]

#v(12pt)

// ─────────────────────────────────────────────
//  Two-column layout for categories
// ─────────────────────────────────────────────
#let category(title, items) = [
  === #text(weight: "bold", size: 11pt)[#title]
  #v(-2pt)
  #line(length: 100%, stroke: 0.5pt + rgb("cccccc"))
  #v(2pt)
  #items
  #v(8pt)
]

#grid(
  columns: (1fr, 1fr),
  gutter: 24pt,
  [
    #category("Documents")[
      - [ ] Passport / ID
      - [ ] Visa (if required)
      - [ ] Boarding passes
      - [ ] Travel insurance
      - [ ] Hotel confirmations
      - [ ] Emergency contacts
      - [ ] Copies of documents (digital + physical)
    ]

    #category("Money")[
      - [ ] Wallet / Cards
      - [ ] Local currency / Cash
      - [ ] Notify bank of travel
      - [ ] Travel credit card
    ]

    #category("Electronics")[
      - [ ] Phone + charger
      - [ ] Power adapter (check plug type)
      - [ ] Power bank
      - [ ] Headphones
      - [ ] Laptop / tablet (if needed)
      - [ ] E-reader
      - [ ] Camera + memory cards
    ]

    #category("Clothing")[
      - [ ] Weather-appropriate outfits
      - [ ] Comfortable walking shoes
      - [ ] Sleepwear
      - [ ] Underwear / socks
      - [ ] Swimwear (if needed)
      - [ ] Light jacket / layers
      - [ ] Hat / sunglasses
    ]
  ],
  [
    #category("Toiletries")[
      - [ ] Toothbrush / toothpaste
      - [ ] Deodorant
      - [ ] Shampoo / conditioner
      - [ ] Skincare
      - [ ] Sunscreen
      - [ ] Personal medications
      - [ ] First aid kit
      - [ ] Razor / grooming
    ]

    #category("Carry-On Essentials")[
      - [ ] Water bottle (empty for security)
      - [ ] Snacks
      - [ ] Neck pillow / eye mask
      - [ ] Entertainment (book, games)
      - [ ] Pen (for customs forms)
      - [ ] Tissues / wet wipes
      - [ ] Change of clothes
    ]

    #category("Before Leaving")[
      - [ ] Lock doors / windows
      - [ ] Unplug appliances
      - [ ] Set thermostat
      - [ ] Hold mail / deliveries
      - [ ] Water plants
      - [ ] Set out-of-office email
      - [ ] Charge all devices
    ]
  ]
)

// ─────────────────────────────────────────────
//  Footer
// ─────────────────────────────────────────────
#v(1fr)
#align(center)[
  #text(size: 8pt, fill: rgb("999999"))[
    Generated with Typst • github.com/typst/typst
  ]
]
