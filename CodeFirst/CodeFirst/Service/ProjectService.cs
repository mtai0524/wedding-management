using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class ProjectService
    {
        private readonly ApplicationDbContext dbContext;

        public ProjectService(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<List<Project>> GetAllProject()
        {
            var projectList = await dbContext.Projects.ToListAsync();
            return projectList;
        }
    }
}
