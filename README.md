DynamicQuestions
================

iOS app code illustrating dynamic YES/NO set of questions loaded from a JSON file. Quick demo focusing on models rather than the view.

Model Classes
-------------

*VRQuestion* is a model object that represent a text question with a yes or no answer. It's set up like a binary tree containing a pointer to the next YES question and the next NO Question.

*VRAnswer* is a model object that contains a pointer to the answered question, the boolean result and a pointer to the next answer. It's set up as a linked-list.

*VRQuestionnaire* loads up the JSON array and sets up the VRQuestion objects. It also stores the first and last answer objects so that the linked list forms a queue. The next answer gets enqueued onto the end of the last answer.


View Controller Classes
-----------------------
*VRQuestionViewController* is controller that loads the question model and presents it into a view. It also fires off the question view controller delegate when someone chooses YES or NO for that question.


Magic
-----

For the sake of readability quite a bit of the logic happens in the app delegate. The app delegate initialises the *VRQuestionnaire* instance and sets up the questions. It then sets up the first question view controller on the navigation controller. Each VRQuestionViewController is configured so the app delegate is the VRQuestionViewControllers delegate too. Once a question has been answered, it calls back questionViewController:didAnswerQuestion:withResult: where the app delegate pushs the result onto the questionnaire's answer list and then moves along the question tree to display the next question.
