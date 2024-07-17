using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addTableMenuItemComboMenu : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MenuEntity_ComboMenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity");

            migrationBuilder.DropIndex(
                name: "IX_MenuEntity_ComboMenuEntityComboMenuId",
                table: "MenuEntity");

            migrationBuilder.DropColumn(
                name: "ComboMenuEntityComboMenuId",
                table: "MenuEntity");

            migrationBuilder.CreateTable(
                name: "MenuItemComboMenu",
                columns: table => new
                {
                    MenuItemComboMenuId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MenuId = table.Column<int>(type: "int", nullable: false),
                    ComboMenuId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MenuItemComboMenu", x => x.MenuItemComboMenuId);
                    table.ForeignKey(
                        name: "FK_MenuItemComboMenu_ComboMenuEntity_ComboMenuId",
                        column: x => x.ComboMenuId,
                        principalTable: "ComboMenuEntity",
                        principalColumn: "ComboMenuId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MenuItemComboMenu_MenuEntity_MenuId",
                        column: x => x.MenuId,
                        principalTable: "MenuEntity",
                        principalColumn: "MenuId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MenuItemComboMenu_ComboMenuId",
                table: "MenuItemComboMenu",
                column: "ComboMenuId");

            migrationBuilder.CreateIndex(
                name: "IX_MenuItemComboMenu_MenuId",
                table: "MenuItemComboMenu",
                column: "MenuId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MenuItemComboMenu");

            migrationBuilder.AddColumn<int>(
                name: "ComboMenuEntityComboMenuId",
                table: "MenuEntity",
                type: "int",
                nullable: true);

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
    }
}
