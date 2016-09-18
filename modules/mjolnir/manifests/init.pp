class mjolnir {
  package { 'Mjolnir':
    source   => 'https://github.com/sdegutis/mjolnir/releases/download/0.4.3/Mjolnir-0.4.3.zip',
    provider => 'compressed_app'
  }
  exec { 'luarocks install mjolnir.hotkey': }
  exec { 'luarocks install mjolnir.application': }
}
