using CodeFirst.Models.Entities;
using CodeFirst.Service;

namespace MyTesting
{
    public class GreetingServiceTests
    {
        [Fact]
        public void TaskToDo_Initialization_Test()
        {
            // Arrange
            var task = new TaskToDo();

            // Act
            task.TaskId = 1;
            task.Name = "Test Task";
            task.Priority = "High";
            task.Position = 1;
            task.ProjectId = 1;
            task.UserId = "user123";
            task.CreatedAt = DateTime.UtcNow;
            task.UpdatedAt = DateTime.UtcNow;
            task.TaskColor = "Red";

            // Assert
            Assert.Equal(1, task.TaskId);
            Assert.Equal("Test Task", task.Name);
            Assert.Equal("High", task.Priority);
            Assert.Equal(1, task.Position);
            Assert.Equal(1, task.ProjectId);
            Assert.Equal("user123", task.UserId);
            Assert.NotNull(task.CreatedAt);
            Assert.NotNull(task.UpdatedAt);
            Assert.Equal("Red", task.TaskColor);
        }

        [Fact]
        public void GetGreeting_ReturnsHelloWorld()
        {
            // Arrange
            var service = new GreetingService();

            // Act
            var result = service.GetGreeting();

            // Assert
            Assert.Equal("Hello, World!", result);
        }
        // [Fact]
        // public void GetGreeting_ReturnsHello()
        // {
        //     // Arrange
        //     var service = new GreetingService();

        //     // Act
        //     var result = service.GetGreeting();

        //     // Assert
        //     Assert.Equal("Hello123", result); // Thay đổi giá trị mong đợi để test case fail
        // }
    }
}