using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class BranchService
    {
        private readonly ApplicationDbContext _context;

        public BranchService(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task AddBranchAsync(Branch branch){
            _context.Branch.Add(branch);
            await _context.SaveChangesAsync();
        }
        public async Task<List<Branch>> GetBranchesAsync()
        {
            return await _context.Branch.ToListAsync();
        }
        public async Task<List<Hall>> GetHallsAsync()
        {
            return await _context.Hall.Include(h => h.Branch).ToListAsync();
        }
        public async Task<Branch> GetBranchByIdAsync(int id)
        {
            return await _context.Branch.FindAsync(id);
        }

        public async Task<bool> LockBranchAsync(int branchId)
        {
            var branch = await _context.Branch.FindAsync(branchId);
            if (branch != null)
            {
                branch.IsLocked = true; // Tạm khóa chi nhánh
                _context.Entry(branch).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<bool> UnlockBranchAsync(int branchId)
        {
            var branch = await _context.Branch.FindAsync(branchId);
            if (branch != null)
            {
                branch.IsLocked = false; // Mở khóa chi nhánh
                _context.Entry(branch).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<bool> DeleteBranchAsync(int branchId)
        {
            var branch = await _context.Branch.FindAsync(branchId);
            if (branch != null)
            {
                // Lấy danh sách các bản ghi Feedback liên quan đến chi nhánh cần xóa
                var feedbacks = _context.Feedback.Where(f => f.BranchId == branchId);

                // Xóa các bản ghi Feedback
                _context.Feedback.RemoveRange(feedbacks);

                // Xóa chi nhánh
                _context.Branch.Remove(branch);

                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }
    }
}
