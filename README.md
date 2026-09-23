# Flatpack Rush

An arcade racer in the style of the 1986 classic, except you're driving a blue-and-yellow flat-pack delivery truck. The job: get order #04417 (one sofa in 212 pieces, two bookcases, a wardrobe and 40 spare allen keys) to the Svensson family at Lingonvägen 7 before the delivery window closes.

## Run it

Double-click `flatpack-rush.html`. That's it. There's no install, no build step and no server.

- Works in any modern browser (Chrome, Safari, Firefox, Edge).
- Works offline. Only the headline font (Bungee, from Google Fonts) needs a connection; without one it falls back to a plain bold font.
- Sound starts on your first click or key press, because browsers block autoplay.

## Controls

| Key | Action |
| --- | --- |
| ← → or A D | Steer |
| ↑ or W | Accelerate |
| ↓ or S | Brake |
| R | Change radio station |
| P or Esc | Pause |
| M | Mute |
| Enter | Start / restart |

On phones and tablets, touch buttons appear under the game screen.

## How to play

- **Time:** you start with 62 seconds. Each **KONTROLL** checkpoint gantry adds time (+46, +46, +44, +42 seconds). Hit zero and it's game over.
- **Cargo:** crashes damage the load. Traffic costs 6%, roadside scenery 4%, and a moose 14%. Moose wander across the road; they always win.
- **Off-road:** leaving the tarmac slows you to a crawl.
- **Scoring:** distance points, plus a time bonus and a cargo bonus if you deliver. The customers leave a star review based on how much furniture survived.

### Stages

1. Pine Forest · E4 south (dusk)
2. Lake Vättern · fika stop
3. Midsummer meadows (maypoles)
4. Norrland · polar night (snow, aurora, lots of moose)
5. Suburbia · Lingonvägen (the delivery)

### Radio

- 88.6 FM: Allen Key Groove
- 101.2 FM: Köttbulle Disco
- Tyst: engine only

## How it works

One self-contained HTML file: HTML, CSS and plain JavaScript on a `<canvas>`. No frameworks, no npm, no image or audio files.

- **Road:** pseudo-3D segment projection, the technique the original arcade games used. The track is a list of short road segments, each with a curve and a height. Every frame they're projected to screen space and drawn as trapezoids from the far end forward, with sprites painted back-to-front. The approach follows Jake Gordon's *javascript-racer* tutorial and Lou's "Pseudo 3d" page.
- **Art:** every sprite (truck, cars, moose, trees, houses, billboards, gantries) is drawn with canvas shapes once at startup and cached.
- **Sound:** the music, engine and sound effects are made live with the Web Audio API from oscillators and noise.
- **Loop:** fixed 60 Hz update step, so the speed stays the same on any display refresh rate.
- **Track:** generated from a fixed seed (`4417`), so the road is the same every run. Traffic is random each run.

## Tweaking

Everything lives in the `<script>` block near the bottom of the file. Useful places to start:

| What | Where |
| --- | --- |
| Difficulty and timing | `START_TIME`, `BONUS`, `STAGE_LEN` |
| Truck handling | `ACCEL`, `BRAKE`, `CENTRI` (how hard curves push you out) |
| Traffic and moose per stage | `resetCars()`: the `count` and `moose` arrays |
| Stage colours, scenery and fog | the `THEMES` array |
| Billboard slogans | `billboards` in `buildSprites()` |
| Road shape | `buildTrack()`: the seed and the curve/hill values |
| Music | the `STATIONS` array (MIDI note numbers, tempo, chord steps) |

## Branding

There's deliberately no real retailer name or logo in the game. The truck says *HEMLEVERANS* ("home delivery"), the store says *VARUHUS* ("department store"), and the product names are invented. If you have permission to use real branding for an internal demo, the truck art is in `buildSprites()` (look for `S.truck`) and the store is `S.store`.

## Credits

Built with Claude (Cowork) for a demo. Inspired by the classic 1986 arcade racer; no original game assets or names are used.
