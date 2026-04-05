## Info on GitHub education for students

https://www.youtube.com/watch?v=umRy69br51E

## Few notes from Microsoft AI Tour in NYC

To help you navigate these tools in the 2026 landscape, here are the most critical "need-to-know" comparisons organized into markup tables.

### 1. The Core AI Development Hubs

The biggest point of confusion is often between **Azure AI Foundry** (the modern interface) and **Azure ML** (the classic backend).

| Feature | Azure AI Foundry (ai.azure.com) | Azure Machine Learning (ML) |
| --- | --- | --- |
| **Primary Goal** | Building Generative AI & Agents | Training & Tuning Custom Models |
| **Best For** | Prototyping Copilots quickly | Heavy-duty Data Science |
| **Key Assets** | Model Catalog (OpenAI, Llama 4) | Data Assets, Compute Clusters |
| **Skill Level** | App Developers / AI Engineers | Data Scientists / ML Engineers |
| **Agentic AI** | Native "Agent Service" built-in | Complex custom Python pipelines |

---

### 2. Modern Container Hosting

If you are moving beyond simple "chat bots" into production-grade AI applications, you’ll choose between these two:

| Feature | Azure Container Apps (ACA) | Azure Kubernetes Service (AKS) |
| --- | --- | --- |
| **The "Vibe"** | Simple, "Set it and forget it" | Full Control, "Turn every knob" |
| **Scaling** | **Scale to Zero** (Save money) | Manual or Node-based scaling |
| **Management** | Serverless (Azure handles K8s) | You manage the cluster & nodes |
| **Ideal Use Case** | AI Agents & Microservices | Large Enterprise Platforms |
| **GPU Support** | Serverless GPU (On-demand) | Dedicated GPU Node Pools |

---

### 3. Agent Deployment & Integration

In 2026, the **Agent 365 Dashboard** and **Work IQ** are the "connective tissue" between Azure AI and your daily apps.

| Feature | Agent 365 Dashboard | Work IQ (via MS Graph) |
| --- | --- | --- |
| **Function** | Admin "Control Plane" | Context "Intelligence Layer" |
| **Who uses it** | IT Admins & Security Officers | The Agent itself (to learn about you) |
| **Key Value** | Monitoring safety & costs | Understanding project relationships |
| **Requirement** | **Must register Agent IDs** to publish | Requires Graph API permissions |

---

### 4. Special Capabilities: Artifacts & Search

These are the features that make agents "useful" rather than just "talkative."

* **Artifacts:** In 2026, agents use a side-window interface (pioneered by Claude) to render code, documents, and diagrams. It separates the "thinking" (Chat) from the "product" (Artifact).
* **Azure AI Search:** Acts as the **Long-Term Memory**. It uses "Vector Embeddings" to index your internal PDFs/Emails so the agent can find specific facts in milliseconds.

---

### Summary of the Microsoft-NVIDIA Ecosystem

* **Infrastructure:** Azure provides the **Blackwell/Rubin GPU** clusters.
* **Software:** You use **build.nvidia.com** to grab "NIMs" (optimized model containers).
* **Outcome:** You get "Local-like" speed on a global cloud scale.
