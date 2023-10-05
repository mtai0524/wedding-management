using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class initTableOrderMenu : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "OrderMenu",
                columns: table => new
                {
                    OrderMenuId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvoiceID = table.Column<int>(type: "int", nullable: true),
                    MenuId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderMenu", x => x.OrderMenuId);
                    table.ForeignKey(
                        name: "FK_OrderMenu_Invoice_InvoiceID",
                        column: x => x.InvoiceID,
                        principalTable: "Invoice",
                        principalColumn: "InvoiceID");
                    table.ForeignKey(
                        name: "FK_OrderMenu_MenuEntity_MenuId",
                        column: x => x.MenuId,
                        principalTable: "MenuEntity",
                        principalColumn: "MenuId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_OrderMenu_InvoiceID",
                table: "OrderMenu",
                column: "InvoiceID");

            migrationBuilder.CreateIndex(
                name: "IX_OrderMenu_MenuId",
                table: "OrderMenu",
                column: "MenuId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "OrderMenu");
        }
    }
}
