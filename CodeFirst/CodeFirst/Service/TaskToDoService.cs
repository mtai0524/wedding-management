using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class TaskToDoService
    {
        private readonly ApplicationDbContext dbContext;

        public TaskToDoService(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public List<TaskToDo> GetListTaskByProjectId(int projectId)
        {
            var tasks = dbContext.TaskToDo
                    .Where(x => x.ProjectId == projectId)
                    .ToList();
            return tasks;
        }
    }
}
