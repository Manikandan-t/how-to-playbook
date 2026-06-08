
# Deep Agents + NVIDIA Nemotron Setup

# 🧠 Deep Agents Code + NVIDIA Nemotron (Claude-like Terminal Agent)

This repo shows how to run **Deep Agents Code (Claude Code-like AI coding agent)** using **NVIDIA NIM models**, specifically:

> nvidia/nemotron-3-super-120b-a12b

---

## 🚀 What you get

A terminal AI agent that can:

- Read and edit your codebase
- Run shell commands
- Debug errors automatically
- Refactor projects
- Keep multi-step reasoning context
- Work like Claude Code / Cursor CLI

Powered by NVIDIA-hosted LLMs.

---

## 🧠 Working Model

Recommended working configuration:



**openai:nvidia/nemotron-3-super-120b-a12b**



This is the **correct provider format** for Deep Agents Code.

---

## 📦 Prerequisites

- Python 3.11+
- `uv` (recommended) or pip
- NVIDIA API key from:
  https://build.nvidia.com

---

## 🔑 Get NVIDIA API Key

1. Go to:
   https://build.nvidia.com/

2. Create account

3. Generate API key

4. Copy it (starts with `nvapi-...`)

---

## ⚙️ Installation

### Install Deep Agents Code

```bash
curl -LsSf https://langch.in/gh-da-cli | bash
````

Or with extras:

```bash
DEEPAGENTS_EXTRAS="nvidia" curl -LsSf https://langch.in/gh-da-cli | bash
```

---

## 🔐 Environment Setup

Add your API key:

```bash
export OPENAI_API_KEY="nvapi-xxxxx"
export OPENAI_BASE_URL="https://integrate.api.nvidia.com/v1"
```

(Optional but recommended in `.bashrc` or `.zshrc`)

---

## ▶️ Run Deep Agents Code

### Using Nemotron (Best setup)

```bash
deepagents-code -M openai:nvidia/nemotron-3-super-120b-a12b
```

---

### Alternative models

```bash
# Faster model
deepagents-code -M openai:meta/llama-3.3-70b-instruct
```

```bash
# Reasoning-heavy model
deepagents-code -M openai:nvidia/llama-3.1-nemotron-ultra-253b-v1
```

---

## 🧪 Verify Setup

Test NVIDIA API:

```bash
curl https://integrate.api.nvidia.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY"
```

---

## 🧠 How It Works

Deep Agents Code uses:

* OpenAI-compatible API layer
* Tool-calling agent loop
* File system access
* Shell execution
* Multi-step reasoning

NVIDIA NIM acts as the backend LLM.

---

## ⚡ Example Usage

Inside `deepagents-code`:

```text
> analyze this repo and explain architecture
> fix failing tests
> refactor authentication module
> optimize performance bottlenecks
```

---

## 🚨 Common Issues

### ❌ UnknownProviderError

Fix:

```bash
use: openai:<model>
```

---

### ❌ NotFoundError

Cause:

* model not enabled in NVIDIA account

Fix:

* run `/models` API check

---

### ❌ Empty response / crash

Fix:

* ensure correct base URL:

```
https://integrate.api.nvidia.com/v1
```
