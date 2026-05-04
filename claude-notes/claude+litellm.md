## LiteLLM with Claude Code + NVIDIA Models Integration

### 📌 Overview

Use LiteLLM as a proxy server to route Claude Code requests to NVIDIA-hosted models (or other providers) through a unified interface.

---

### 🧭 Architecture

```text
Claude Code / curl
        ↓
LiteLLM Proxy (localhost:4000)
        ↓
NVIDIA API / other providers
```

---

### ⚙️ Installation

```bash
uv add litellm
uv tool install 'litellm[proxy]'
```

---

### 🧾 LiteLLM Configuration

Create:

```text
config.yaml
```

```yaml
litellm_settings:
  drop_params: true

model_list:
  - model_name: "nemotron"
    litellm_params:
      model: "nvidia_nim/nvidia/nemotron-3-super-120b-a12b"
      api_key: "os.environ/NVIDIA_API_KEY"
      api_base: "https://integrate.api.nvidia.com/v1"
      extra_body:
        chat_template_kwargs: {"enable_thinking": True}
        reasoning_budget: 16384
```

---

### ▶️ Run LiteLLM Proxy

Get API key from: [https://build.nvidia.com](https://build.nvidia.com)

```bash
export NVIDIA_API_KEY=<your-nvidia-api-key>
litellm --config config.yaml
```

Default proxy runs on:

```text
http://localhost:4000
```

---

### ⚙️ Configure Claude Code

```bash
export ANTHROPIC_BASE_URL=http://localhost:4000
export ANTHROPIC_API_KEY=dummy

export ANTHROPIC_DEFAULT_OPUS_MODEL=nemotron
export ANTHROPIC_DEFAULT_SONNET_MODEL=nemotron
export ANTHROPIC_DEFAULT_HAIKU_MODEL=nemotron
export CLAUDE_CODE_SUBAGENT_MODEL=nemotron
```

---

### ▶️ Run Claude

```bash
claude
```

---

## 🔌 Why LiteLLM is different (translation layer model)

LiteLLM works differently from OpenRouter.

> It does NOT natively expose Anthropic-compatible APIs
> It translates requests internally before routing them

---

### 🔄 Request flow

```text
Claude Code (Anthropic format)
        ↓
LiteLLM (translates Anthropic → provider-specific format)
        ↓
NVIDIA / OpenAI / other model APIs
```

---

### 🧩 Key points

```text
✔ Acts as a protocol translation layer
✔ Normalizes multiple provider APIs into one interface
✔ Enables routing, fallback, and multi-provider control
```

---

### 🧠 Why this matters

Unlike OpenRouter (which is Anthropic-compatible by default), LiteLLM acts as a **universal adapter layer**, translating between different provider formats before executing requests.