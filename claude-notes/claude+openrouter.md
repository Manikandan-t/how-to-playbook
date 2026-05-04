## Claude Code with OpenRouter Integration

### 📌 Overview

Use OpenRouter as a drop-in backend for Claude Code by overriding Anthropic API settings.

---

### ⚙️ Setup

Create the following file in your project (if not already present):

```text
.claude/settings.local.json
```

---

### 🧾 Configuration

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://openrouter.ai/api",
    "ANTHROPIC_AUTH_TOKEN": "sk-open-router-key",
    "ANTHROPIC_API_KEY": "sk-open-router-key",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "minimax/minimax-m2.5:free",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "minimax/minimax-m2.5:free",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "minimax/minimax-m2.5:free",
    "CLAUDE_CODE_SUBAGENT_MODEL": "minimax/minimax-m2.5:free"
  }
}
```

---

### ▶️ Run

```bash
claude
```

---

### 🧠 How OpenRouter Works (Important Concept)

OpenRouter behaves like:

> “We already speak Anthropic API”

So when you set:

```bash
ANTHROPIC_BASE_URL=https://openrouter.ai/api
```

---

### 🔄 Execution Flow

```text
Claude Code (Anthropic format)
        ↓
OpenRouter (natively understands Anthropic API)
        ↓
Routes to GPT / Qwen / Mistral / other models
```

---

### 🧩 Key Points

```text
✔ No transformation layer needed
✔ Accepts Anthropic-shaped requests directly
✔ Acts mainly as a routing + model gateway layer
```

---

### 🧠 Why this matters

OpenRouter exposes an **Anthropic-compatible interface**, meaning it accepts the same request structure Claude Code already uses and forwards it to different models without converting formats internally.


---

### 🧠 Notes

* All Claude model tiers (Opus, Sonnet, Haiku) are mapped to a single OpenRouter model in this setup
* You can replace `minimax/...` with any model supported by OpenRouter
* Useful for cost experimentation, model comparison, and alternative routing setups
