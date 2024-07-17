using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class PermissionCol : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "CanAdd",
                table: "Permission",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "CanDelete",
                table: "Permission",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "CanEdit",
                table: "Permission",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CanAdd",
                table: "Permission");

            migrationBuilder.DropColumn(
                name: "CanDelete",
                table: "Permission");

            migrationBuilder.DropColumn(
                name: "CanEdit",
                table: "Permission");
        }
    }
}
