import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

export default function App() {
  return (
    <main className="flex min-h-screen items-center justify-center bg-background p-6 text-foreground">
      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle>Frontend Standard Template</CardTitle>
          <CardDescription>
            Vite · React 19 · TypeScript strict · Tailwind CSS · shadcn/ui
          </CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col gap-4">
          <p className="text-sm text-muted-foreground">
            The standard skeleton is ready. Feature architecture, routing, data fetching, and error
            handling land in subsequent phases.
          </p>
          <Button>Get started</Button>
        </CardContent>
      </Card>
    </main>
  );
}
