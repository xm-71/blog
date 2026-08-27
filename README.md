# Claude Agent Watch

A Wear OS companion concept for watching Claude Code / Claude agent sessions
from your wrist — session status at a glance, notifications when an agent
finishes or needs input, and a scrollable log of what it's been doing.

This repository previously held an unrelated Rails blog project; that code
has been removed to make room for this concept.

## Status

This is a **design concept**, not a buildable app yet. There is no public
Anthropic API for streaming personal-account agent activity to a third-party
client, and a real Wear OS build wasn't in scope for this pass. What exists
so far is a set of watch-face mockups exploring the three core screens:

1. **Session glance** — a complication/tile showing whether an agent is
   running, idle, or done, plus elapsed time.
2. **Notification** — an actionable card pushed to the watch when an agent
   finishes a task, hits an error, or is blocked waiting on input.
3. **Activity feed** — a scrollable, near-real-time list of recent tool
   calls / actions the agent has taken.

## Path to a real build

To turn this into a working app, you'd need:

- A backend relay (e.g. a small server you control) that has access to your
  Claude Code sessions/API and exposes a lightweight push/poll endpoint —
  the watch can't call Anthropic directly with a personal account.
- An Android Studio project targeting Wear OS (Kotlin, Jetpack Compose for
  Wear, `androidx.wear.tiles` for the glance, `androidx.wear.watchface` if a
  full watch face is wanted) that talks to that relay.
- Notification channel wiring via `NotificationCompat` + Wear OS bridging
  from a paired phone app, or a standalone connectivity setup if the watch
  has LTE/WiFi.

None of that is built here yet — happy to scaffold the real Gradle/Kotlin
project next if you want to go that direction.
