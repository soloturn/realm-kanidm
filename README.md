# Kanidm Realm

Yggdrasil realm for tracking [kanidm/kanidm](https://github.com/kanidm/kanidm)
— "a simple, secure and fast identity management platform" — via
[Guardian Driven Development](https://siliconsaga.github.io/yggdrasil/gdd/).

Forked from [SiliconSaga/realm-template](https://github.com/SiliconSaga/realm-template).

## Quick Start

```bash
cd yggdrasil
ws realm https://github.com/soloturn/realm-kanidm.git
ws realm use realm-kanidm
ws clone kanidm
```

## Structure

```
ecosystem.yaml           # Declares the kanidm component (upstream + soloturn fork)
adapters/
  kanidm.yaml             # cargo build/test/lint/run commands, verified against
                           # kanidm's own developer docs
README.md                # This file
```
