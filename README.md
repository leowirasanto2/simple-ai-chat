**Announcement**
Incoming new flow: https://excalidraw.com/#json=srCwrvjXW83nwggJHBW5q,aLyIYHWXZsBpyBrPqf0qXA

**Overview**

This repository is a personal project to integrate the AI chat feature into my iOS app.

![Simulator Screen Recording - iPhone 14 - 2025-04-03 at 18 34 20](https://github.com/user-attachments/assets/465e7984-1299-4f63-9071-49b45d93c646)


### Features

1. **Landing Page**:
   - Provides users with easy access to start conversations, view suggestions, and recent chats.
   
2. **Chat Page**:
   - Allows users to engage in interactive conversations with the AI assistant.

3. **Components**:
   - `ChipView`: A custom chip view for displaying topics and suggestions.
   - `SectionView`: A reusable section view to organize content on the landing page.
   - `SquaredCardView`: Updated card design for displaying suggestions.
   - `ChatBubble`: Redesigned chat bubbles to enhance readability and visual appeal.

4. **Models**:
   - `Activity`: Represents user activities and recent chats.
   - `Actor`: Represents participants in the chat (user and AI assistant).
   - `Chat`: Manages individual chat messages.
   - `Suggestion`: Handles suggestions provided to the user.

### Removed Unnecessary Files

- Deleted old models and components that are no longer in use (`PathRoute`, `ChipTextView`, `GroupedChipTextView`, `GroupedSquaredCardView`, `SectionTitleView`, etc.).
- Removed unused Swift Package Manager dependencies.

### Conclusion

These changes collectively aim to simplify the codebase, improve user experience, and provide a solid foundation for future enhancements.
