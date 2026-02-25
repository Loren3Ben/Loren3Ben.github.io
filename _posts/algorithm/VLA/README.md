# 具身智能算法工程师 - 核心技术栈详解

## 📑 目录

本文档集详细解释具身智能领域的核心技术，每个技术包含：
- 核心概念与原理
- 详细架构图
- 关键组件说明
- 实现要点

### 技术文档列表

1. **[VLA模型架构](./01_VLA架构详解.md)** - Vision-Language-Action统一模型
2. **[RT-1与RT-2](./02_RT系列详解.md)** - Google机器人Transformer模型
3. **[强化学习算法](./03_强化学习详解.md)** - RL核心算法与机器人应用
4. **[多模态融合](./04_多模态融合详解.md)** - 视觉-触觉-力反馈融合
5. **[VLM/MLLM模型](./05_VLM_MLLM详解.md)** - 视觉语言大模型
6. **[Sim2Real技术](./06_Sim2Real详解.md)** - 仿真到现实的迁移
7. **[参数高效微调](./07_PEFT详解.md)** - LoRA、Adapter等技术

## 🎯 学习路径建议

### 初级阶段
1. 先理解基础的Transformer架构

   （self-Attention Layer, multi-header）

2. 掌握强化学习基本概念（Q-Learning, DQN, Policy Gradient）

3. 了解计算机视觉基础（CNN, ViT）

### 中级阶段
1. 深入学习RT-1/RT-2的具体实现
2. 实践多模态数据处理
3. 动手实现简单的Sim2Real案例

### 高级阶段
1. 研究最新VLA模型论文
2. 理解大模型微调的各种技术
3. 设计复杂任务的奖励函数

## 📚 参考资源

- **论文合集**: 见各子文档的参考文献
- **代码实现**: PyTorch官方示例、HuggingFace Transformers
- **开源项目**: OpenAI Gym, MuJoCo, Isaac Gym

---

*最后更新时间: 2025-11-07*

