using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addTableComboMenu : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ComboMenuEntityComboMenuId",
                table: "MenuEntity",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "ComboMenuEntity",
                columns: table => new
                {
                    ComboMenuId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ComboMenuEntity", x => x.ComboMenuId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity",
                column: "ComboMenuEntityComboMenuId");

            migrationBuilder.AddForeignKey(
                name: "FK_MenuEntity_ComboMenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity",
                column: "ComboMenuEntityComboMenuId",
                principalTable: "ComboMenuEntity",
                principalColumn: "ComboMenuId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MenuEntity_ComboMenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity");

            migrationBuilder.DropTable(
                name: "ComboMenuEntity");

            migrationBuilder.DropIndex(
                name: "IX_MenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity");

            migrationBuilder.DropColumn(
                name: "ComboMenuEntityComboMenuId",
                table: "MenuEntity");
        }
    }
}
