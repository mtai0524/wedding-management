using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addBranchIdForTableFeedback : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchId",
                table: "Feedback",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Feedback_BranchId",
                table: "Feedback",
                column: "BranchId");

            migrationBuilder.AddForeignKey(
                name: "FK_Feedback_Branch_BranchId",
                table: "Feedback",
                column: "BranchId",
                principalTable: "Branch",
                principalColumn: "BranchId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Feedback_Branch_BranchId",
                table: "Feedback");

            migrationBuilder.DropIndex(
                name: "IX_Feedback_BranchId",
                table: "Feedback");

            migrationBuilder.DropColumn(
                name: "BranchId",
                table: "Feedback");
        }
    }
}
