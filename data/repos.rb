# OSS portfolio cards shown in the Portfolio section.
# Add/remove hashes to reorder or update.
# Keys: name (string), url (string), desc (string), stars (integer or string like "52.5k"),
#       lang (string), role (optional string — "Contributor", "Author", etc.)

module SiteData
  REPOS = [
    {
      name: "Ghost",
      url: "https://github.com/TryGhost/Ghost",
      desc: "Independent technology for modern publishing, memberships, subscriptions and newsletters.",
      stars: "52.5k",
      lang: "JavaScript",
      role: "Contributor",
    },
    {
      name: "Koenig",
      url: "https://github.com/TryGhost/Koenig",
      desc: "Ghost's editor, built on Lexical. Worked on this full-time as part of Ghost's product team.",
      stars: 270,
      lang: "JavaScript",
      role: "Contributor",
    },
    {
      name: "ghost-ruby",
      url: "https://github.com/ronaldlangeveld/ghost-ruby",
      desc: "Ruby client for Ghost's Content & Admin APIs. Browse, read, create, edit, delete — idiomatic Ruby.",
      stars: 9,
      lang: "Ruby",
    },
    {
      name: "python-fiix-cmms-client",
      url: "https://github.com/Saint-Solutions/python-fiix-cmms-client",
      desc: "Production-grade Fiix CMMS interfacing client for Python.",
      stars: 8,
      lang: "Python",
      role: "Author",
    },
    {
      name: "telefizz",
      url: "https://github.com/ronaldlangeveld/telefizz",
      desc: "Production webhook relay: Fizzy → Telegram. Clean Architecture, no Zapier required.",
      stars: 5,
      lang: "Ruby",
    },
    {
      name: "node-payfast",
      url: "https://github.com/ronaldlangeveld/node-payfast",
      desc: "Node library for building custom Payfast payment integrations.",
      stars: 2,
      lang: "JavaScript",
    },
  ].freeze
end
